From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 11 Oct 2019 13:00:13 +0000
Subject: Re: [v3] thunderbolt: Fix to check the return value of kmemdup
Message-Id: <f2960ada-7e06-33d1-1533-78989a3e1d2a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190325212523.11799-1-pakki001@umn.edu>
In-Reply-To: <20190325212523.11799-1-pakki001@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Aditya Pakki <pakki001@umn.edu>, Andreas Noever <andreas.noever@gmail.com>, Kangjie Lu <kjlu@umn.edu>, Michael Jamet <michael.jamet@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

> uuid in add_switch is allocted via kmemdup which can fail.

I have tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “icm_handle_event” contains still an unchecked call
of the function “kmemdup”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/thunderbolt/icm.c?id=3cdb9446a117d5d63af823bde6fe6babc312e77b#n1627
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/thunderbolt/icm.c#L1627

How do you think about to improve it?

Regards,
Markus
