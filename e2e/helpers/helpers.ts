import { Page } from "@playwright/test";

export function removeDuplicatedElements(page: Page) {
  page.locator('[class="RNmpXc"] >> nth=0').evaluate((e) => e.remove());
}
