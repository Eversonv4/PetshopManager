// app/javascript/controllers/animal_selector_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["userSelect", "animalSelect"];

  connect() {
    // Para garantir que o controlador Stimulus está carregado corretamente
    console.log("Controlador AnimalSelector conectado!");
  }

  async loadAnimals() {
    console.log("Carregando animais...");
    const userId = this.userSelectTarget.value;

    if (userId) {
      const data = await fetch(`/appointments/load_animals?user_id=${userId}`)
        .then(response => response.json())
        .then(data => data)
        .catch(error => console.error('Erro ao carregar animais:', error));

        this.updateAnimalSelect(data);
    }
  }

  updateAnimalSelect(animals) {
    // Limpa as opções anteriores
    this.animalSelectTarget.innerHTML = "<option value=''>Selecione um animal</option>";

    animals.forEach(animal => {
      const option = document.createElement("option");
      option.value = animal.id;
      option.textContent = animal.nome;
      this.animalSelectTarget.appendChild(option);
    });
  }
}
