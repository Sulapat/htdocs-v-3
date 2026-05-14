// sampleData.js — shared data source
// ใช้ร่วมกันระหว่าง TestResult.vue และ StatsIndex.vue
// เมื่อต้องการเชื่อมแหล่งข้อมูลจริง ให้แทนที่ sampleData ตรงนี้จุดเดียว

export const sampleData = [
  { ID: 1,   'First Name': 'Karn',      'Last Name': 'Deeying',           Company: 'Rayong Engineering & Plant Service Co., Ltd. (REPCO)',  Mail: 'repconex@scg.com',                  Member: '0001',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 2,   'First Name': 'Chotiwit',  'Last Name': 'Kunathananon',       Company: 'Rayong Engineering & Plant Service Co., Ltd. (REPCO)', Mail: 'repconex@scg.com',                  Member: '0002',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 3,   'First Name': 'Khemapat', 'Last Name': 'Tontiwattanakul',    Company: 'KMUTNB',                                                Mail: 'khemapat.t@eng.kmutnb.ac.th',       Member: '0003',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 6,   'First Name': 'Pisit',    'Last Name': 'Sirisoponwattana',   Company: 'Rayong Engineering and Plant Service Co., Ltd.',        Mail: 'Pisitsirisoponwattana@gmail.com',   Member: '0004',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 8,   'First Name': 'Kolawach', 'Last Name': 'Chalermpong',        Company: 'KMITL',                                                 Mail: 'kolawach.ch@kmitl.ac.th',           Member: '0005',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 9,   'First Name': 'Nguyen',   'Last Name': 'Phuong Hung',        Company: 'NARIME',                                                Mail: 'hungnp@narime.gov.vn',              Member: '0006',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATIII' },
  { ID: 29,  'First Name': 'Tran',     'Last Name': 'Duy Hoai',           Company: 'Au Viet Technical Equipment JSC',                       Mail: 'hoai.tran@avitek.vn',               Member: '0007',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATII, CATIII' },
  { ID: 33,  'First Name': 'Danai',    'Last Name': 'Nantasup',           Company: 'Eastern Water',                                         Mail: 'danai_nan@eastwater.com',           Member: '0008',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 34,  'First Name': 'Anuthida', 'Last Name': 'Palarit',            Company: 'Eastern Water',                                         Mail: 'anuthida_pal@eastwater.com',        Member: '0009',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATII'},
  { ID: 36,  'First Name': 'Kamolwan', 'Last Name': 'Weerachatsakul',     Company: 'REPCO',                                                 Mail: 'hrtech2@scg.com',                   Member: '0010',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATII, CATIII' },
  { ID: 37,  'First Name': 'Metee',    'Last Name': 'Meerabeab',          Company: 'GC Maintenance & Engineering',                          Mail: 'metee.m@pttgcgroup.com',            Member: '0011',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 38,  'First Name': 'Nitigorn', 'Last Name': 'Eakchay',            Company: 'GC Maintenance & Engineering',                          Mail: 'nitigorn.e@pttgcgroup.com',         Member: '0012',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATII'},
  { ID: 45,  'First Name': 'Jakkarin', 'Last Name': 'Sumethasorn',        Company: 'SKF Thailand',                                          Mail: 'jakkarin.sumethasorn@skf.com',      Member: '0013',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATII'},
  { ID: 57,  'First Name': 'Anutr',    'Last Name': 'Ratipann',           Company: 'Bridgestone Asia Pacific',                              Mail: 'anutr.ratipann1@bridgestone.com',   Member: '0014',        Level: 'ยังมีรายชื่ออยู่ใน VI | CATII'},
]

// ----- Derived helpers (ใช้ได้ทั้ง 2 หน้า) -----

/** นับจำนวนแยกตาม course tag — ใช้ regex ป้องกัน CATII ชน CATIII */
export const countByCourse = {
  CATII:  sampleData.filter(d => /CATII(?![IV])/.test(d.Level)).length,
  CATIII: sampleData.filter(d => d.Level.includes('CATIII')).length,
  CATIV:  sampleData.filter(d => d.Level.includes('CATIV')).length,
  BMV:    sampleData.filter(d => d.Level.includes('BMV')).length,
}

/** รายชื่อ company ที่ไม่ซ้ำ */
export const uniqueCompanies = [...new Set(sampleData.map(d => d.Company))]

/**
 * filter ตาม course key — ใช้ function แทน static object
 * เพื่อให้ Vue computed ที่เรียกใช้ reactive ได้ถูกต้องทุกครั้ง
 */
export const getDataByFilter = (key) => {
  switch (key) {
    case 'BMV':  return sampleData.filter(d => d.Level.includes('BMV'))
    case 'C2VA': return sampleData.filter(d => /CATII(?![IV])/.test(d.Level))
    case 'C3VA': return sampleData.filter(d => d.Level.includes('CATIII'))
    case 'C4VA': return sampleData.filter(d => d.Level.includes('CATIV'))
    default:     return sampleData
  }
}

/** @deprecated ใช้ getDataByFilter(key) แทน */
export const dataByFilter = {
  ALL:  sampleData,
  BMV:  sampleData.filter(d => d.Level.includes('BMV')),
  C2VA: sampleData.filter(d => /CATII(?![IV])/.test(d.Level)),
  C3VA: sampleData.filter(d => d.Level.includes('CATIII')),
  C4VA: sampleData.filter(d => d.Level.includes('CATIV')),
}