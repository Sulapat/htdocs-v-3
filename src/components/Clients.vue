<template>
    <div class="Ciients">
        <!-- Navigation -->
        <div id="nav-placeholder"></div>
        <!-- Portfolio Section -->
        <div class="portfolio-container" id="Portfolio">
            <div class="portfolio-header">
                <h1>{{ $t('clients.title') }}</h1>
                <p>{{ $t('clients.subtitle') }}</p>
            </div>

            <div class="clients-grid">  
                <!-- Client Card Template - Repeat for each logo -->
                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Atsumitec.jpg" alt="Atsumitec" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Atsumitec</div>
                        <div class="client-description">{{ $t('clients.desc.atsumitec') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/B_G.jpg" alt="B.G" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Bgrim</div>
                        <div class="client-description">{{ $t('clients.desc.b_g') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/BD_th.jpg" alt="BD Thailand" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Broadcast depot Thailand</div>
                        <div class="client-description">{{ $t('clients.desc.bd_thailand') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/BDMS.jpg" alt="BDMS" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">BDMS</div>
                        <div class="client-description">{{ $t('clients.desc.bdms') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Boon.jpg" alt="Boon" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Boon Rawd Brewery</div>
                        <div class="client-description">{{ $t('clients.desc.boon') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Daikin.jpg" alt="Daikin" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Daikin</div>
                        <div class="client-description">{{ $t('clients.desc.daikin') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Egat.jpg" alt="EGAT" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">EGAT</div>
                        <div class="client-description">{{ $t('clients.desc.egat') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/enfourt.jpg" alt="Enfourt" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Enfourtech</div>
                        <div class="client-description">{{ $t('clients.desc.enfourt') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/GCME.jpg" alt="GCME" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">GCME</div>
                        <div class="client-description">{{ $t('clients.desc.gcme') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Griffith.jpg" alt="Griffith" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Griffith</div>
                        <div class="client-description">{{ $t('clients.desc.griffith') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Gulf.jpg" alt="Gulf" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Gulf</div>
                        <div class="client-description">{{ $t('clients.desc.gulf') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/GYPROC.png" alt="GYPROC" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">GYPROC</div>
                        <div class="client-description">{{ $t('clients.desc.gyproc') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/IHI.jpg" alt="IHI" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">IHI</div>
                        <div class="client-description">{{ $t('clients.desc.ihi') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Indoama.jpg" alt="Indoama" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Indorama</div>
                        <div class="client-description">{{ $t('clients.desc.indoama') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Is_software.jpg" alt="IS Software" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">IS Software</div>
                        <div class="client-description">{{ $t('clients.desc.is_software') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/JSJS.jpg" alt="JSJS" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Johnson & Johnson</div>
                        <div class="client-description">{{ $t('clients.desc.jsjs') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/KI.jpg" alt="KI" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">ki sugar group</div>
                        <div class="client-description">{{ $t('clients.desc.ki') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/KKF.jpg" alt="KKF" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">KKF khon kaen</div> 
                        <div class="client-description">{{ $t('clients.desc.kkf') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Mars.jpg" alt="Mars" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Mars petcare</div>
                        <div class="client-description">{{ $t('clients.desc.mars') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Mitr_phol.jpg" alt="Mitr Phol" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Mitr Phol</div>
                        <div class="client-description">{{ $t('clients.desc.mitr_phol') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Nestle.jpg" alt="Nestle" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Nestle</div>
                        <div class="client-description">{{ $t('clients.desc.nestle') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Npp.jpg" alt="Npp" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">NPP Combined Heat and Power Producing</div>
                        <div class="client-description">{{ $t('clients.desc.npp') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Nteq.jpg" alt="Nteq" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Nteq polymer co. ltd</div>
                        <div class="client-description">{{ $t('clients.desc.nteq') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/PAE.jpg" alt="PAE" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">PAE</div>
                        <div class="client-description">{{ $t('clients.desc.pae') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Pttep.jpg" alt="PTTEP" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">PTT Exploration and Production</div>
                        <div class="client-description">{{ $t('clients.desc.pttep') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/repo.jpg" alt="Repo" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">REPCO NEX</div>
                        <div class="client-description">{{ $t('clients.desc.repo') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/sahakol.png" alt="Sahakol" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Sahakol Equipment</div>
                        <div class="client-description">{{ $t('clients.desc.sahakol') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/SCG.jpg" alt="SCG" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">SCG</div>
                        <div class="client-description">{{ $t('clients.desc.scg') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/seckisui.png" alt="Seckisui" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">SEKISUI</div>
                        <div class="client-description">{{ $t('clients.desc.seckisui') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/SKF.jpg" alt="SKF" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">SKF</div>
                        <div class="client-description">{{ $t('clients.desc.skf') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Sotus.jpg" alt="Sotus" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Sotus</div>
                        <div class="client-description">{{ $t('clients.desc.sotus') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/SSG.jpg" alt="SSG" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">SSG</div>
                        <div class="client-description">{{ $t('clients.desc.ssg') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/SSL.jpg" alt="SSL" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">SSL manufacturing</div>
                        <div class="client-description">{{ $t('clients.desc.ssl') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/STM.jpg" alt="STM" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">STM</div>
                        <div class="client-description">{{ $t('clients.desc.stm') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Thaioil.jpg" alt="Thaioil" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Thai Oil</div>
                        <div class="client-description">{{ $t('clients.desc.thaioil') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Thanakorn.jpg" alt="Thanakorn" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Thanakorn Vegetable Oil Products</div>
                        <div class="client-description">{{ $t('clients.desc.thanakorn') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/TRANE.jpg" alt="TRANE" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">TRANE</div>
                        <div class="client-description">{{ $t('clients.desc.trane') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/Transitions.jpg" alt="Transitions" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">Transitions Optical</div>
                        <div class="client-description">{{ $t('clients.desc.transitions') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/TTM.jpg" alt="TTM" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">TRANS THAI-MALAYSIA </div>
                        <div class="client-description">{{ $t('clients.desc.ttm') }}</div>
                    </div>
                </div>

                <div class="client-card">
                    <img src="@/assets/images/data/Logo_partners/WHA.jpg" alt="WHA" class="client-logo">
                    <div class="client-info">
                        <div class="client-name">WHA</div>
                        <div class="client-description">{{ $t('clients.desc.wha') }}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
  name: 'Clients',
  data() {
    return {
      clients: [
        { id: 1, name: 'Client 1', logo: '...' },
        { id: 2, name: 'Client 2', logo: '...' },
        // ... clients data
      ]
    }
  }
}
</script>

<style>
@import "@/assets/css/Clients.css";
</style>