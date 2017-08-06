From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 06 Aug 2017 22:37:54 +0000
Subject: [PATCH 0/3] power: supply: charger-manager: 1 fix and 2 minor clean-ups
Message-Id: <cover.1502058761.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sre@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This patch series improves 'charger_manager_probe()'. The first patch is
about a missing memory allocation failure test.
The 2 others are just things spotted in this function:
   - a comment that is no more up to date
   - a style issue (which saves 1 line)

Christophe JAILLET (3):
  power: supply: charger-manager: Fix a NULL pointer dereference in
    'charger_manager_probe()'
  power: supply: charger-manager: Fix a comment
  power: supply: charger-manager: Slighly simplify code

 drivers/power/supply/charger-manager.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.11.0

