// Entry point for the build script in your package.json
//
import './base'
import './about'

// Landing page specific JavaScript
document.addEventListener("turbo:load", function() {
  // Only run on landing page
  if (document.querySelector('.landing-hero')) {
    // Add scroll behavior for navbar
    const navbar = document.querySelector('.navbar-dark.fixed-top');
    if (navbar) {
      window.addEventListener('scroll', function() {
        if (window.scrollY > 50) {
          navbar.classList.add('scrolled');
        } else {
          navbar.classList.remove('scrolled');
        }
      });
    }
    
    // Animate feature cards on scroll
    const featureCards = document.querySelectorAll('.feature-card');
    if (featureCards.length > 0) {
      const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            entry.target.classList.add('fadeIn');
            observer.unobserve(entry.target);
          }
        });
      }, { threshold: 0.1 });
      
      featureCards.forEach(card => {
        observer.observe(card);
      });
    }
    
    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
      anchor.addEventListener('click', function(e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
          window.scrollTo({
            top: target.offsetTop - 70,
            behavior: 'smooth'
          });
        }
      });
    });
  }
});