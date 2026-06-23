<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const cerList = ref([])
const loading = ref(true)

onMounted(async () => {
  const res = await axios.get('https://patineer.co.th/api/cer.php')
  cerList.value = res.data
  loading.value = false
})
</script>

<template>
  <div>
    <h2>{{ $t('api.participantListTitle') }}</h2>

    <p v-if="loading">{{ $t('api.loadingMessage') }}</p>

    <table v-else border="1">
      <thead>
        <tr>
          <th>ID</th>
          <th>{{ $t('api.tableHeader.firstName') }}</th>
          <th>{{ $t('api.tableHeader.lastName') }}</th>
          <th>{{ $t('api.tableHeader.company') }}</th>
          <th>Email</th>
          <th>Level</th>
          <th>Member</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="row in cerList" :key="row.ID">
          <td>{{ row.ID }}</td>
          <td>{{ row['First Name'] }}</td>
          <td>{{ row['Last Name'] }}</td>
          <td>{{ row.Company }}</td>
          <td>{{ row.Mail }}</td>
          <td>{{ row.Level }}</td>
          <td>{{ row.Member }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template> 