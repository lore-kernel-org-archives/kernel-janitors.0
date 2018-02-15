From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 15 Feb 2018 19:28:33 +0000
Subject: [PATCH 0/2] cpufreq/PowerNow-K8: Adjustments for two function implementations
Message-Id: <4dd36236-fc39-19e6-c1a7-a094cf13469c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 15 Feb 2018 20:24:26 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in three functions
  Delete an unnecessary return statement in two functions

 drivers/cpufreq/powernow-k8.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

-- 
2.16.1

