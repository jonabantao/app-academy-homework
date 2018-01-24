import React from 'react';

export default ({ giphy }) => (
  <li>
    <img src={giphy.images.fixed_height.url} alt={giphy.slug} />
  </li>
);