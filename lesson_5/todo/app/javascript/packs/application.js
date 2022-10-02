import Rails from "@rails/ujs"

Rails.start()

window.addEventListener("load", () => {
  const destroy_links = document.querySelectorAll("a.destroy[data-remote]");
  destroy_links.forEach((element) => {
    element.addEventListener("ajax:success", () => {
      const tr = element.closest('tr');
      tr.remove();
    });
  });
  const active_links = document.querySelectorAll("tr a.toggle[data-remote]");
  active_links.forEach((element) => {
    element.addEventListener("ajax:success", (event) => {
      element.innerHTML = element.innerHTML == "Activate" ? "Disactivate" : "Activate"
    });
  });
});

