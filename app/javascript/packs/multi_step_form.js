document.addEventListener('turbolinks:load', () => {

  function hideAllSteps() {
    document.querySelectorAll('.form-step').forEach((step) => {
      step.style.display = 'none';
    });
  }

  window.showStep = function(stepNumber) {
    hideAllSteps();
    const stepToShow = document.getElementById(`step-${stepNumber}`);
    if (stepToShow) {
      stepToShow.style.display = 'block';
    } else {
      console.error(`No step found with the id step-${stepNumber}`);
    }
  };

  // Event delegation for handling next/previous buttons
  document.addEventListener('click', (event) => {
    if (event.target.matches('.next-btn')) {
      const currentStep = parseInt(event.target.closest('.form-step').id.replace('step-', ''));
      showStep(currentStep + 1);
    } else if (event.target.matches('.prev-btn')) {
      const currentStep = parseInt(event.target.closest('.form-step').id.replace('step-', ''));
      showStep(currentStep - 1);
    }
  });

  // Start by showing the first step
  showStep(1);
});
