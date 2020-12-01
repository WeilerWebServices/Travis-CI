import TravisRoute from 'travis/routes/basic';
import { inject as service } from '@ember/service';

export default TravisRoute.extend({
  raven: service(),
  accounts: service(),
  features: service(),

  needsAuth: true,

  titleToken(account = {}) {
    return `${account.name || account.login || 'Account'} - Profile`;
  },

  model() {
    return this.accounts.user;
  },

  afterModel(model) {
    if (model && !model.error && !this.features.get('enterpriseVersion'))
      model.fetchBetaMigrationRequests();
  }
});
