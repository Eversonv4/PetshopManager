export function formatPhoneNumber(value) {
  return value.replace(/\D/gi, '').replace(/^(\d{2})(\d{5})(\d{4})/, '($1) $2-$3')
}

export function removeCNPJMask(maskedCNPJ) {
  return maskedCNPJ.replace(/\./gi, '').replace('/', '').replace('-', '')
}

export function removeCEPMask(maskedCEP) {
  return maskedCEP.replace('-', '')
}

export function removeCPFMask(maskedCPF) {
  return maskedCPF.replace(/\./gi, '').replace('-', '')
}

export function removePhoneMask(maskedPhone) {
  return maskedPhone.replace(/\D/gm, '')
}

export function CNPJmask(value) {
  return value.replace(/\D/g, '').replace(/^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/, '$1.$2.$3/$4-$5')
}

export function PhoneMask(value) {
  return value.replace(/\D/gi, '').replace(/^(\d{2})(\d{5})(\d{4})/, '($1) $2-$3')
}

export function CEPmask(value) {
  return value.replace(/\D/g, '').replace(/^(\d{5})(\d{3})/, '$1-$2')
}

export function CPFmask(value) {
  return value.replace(/\D/gi, '').replace(/^(\d{3})(\d{3})(\d{3})(\d{2})/gi, '$1.$2.$3-$4')
}

export function formatingCurrency(value) {
  return value
    .replace(/\D/gi, '')
    .replace(/(\d{2})$/gi, ',$1')
    .replace(/^\,(\d{2})/gi, '0,$1')
    .replace(/^([0])(\d+\,\d{2})/gi, '$2')
}

export function formatingPercentage(value) {
  return value
    .replace(/\D/gi, '')
    .replace(/(\d{2})$/gi, ',$1')
    .replace(/^\,(\d{2})/gi, '0,$1')
    .replace(/^([0])(\d+\,\d{2})/gi, '$2')
}
