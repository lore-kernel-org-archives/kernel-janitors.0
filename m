From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 11 Oct 2019 14:13:22 +0000
Subject: Re: [v3] thunderbolt: Fix to check the return value of kmemdup
Message-Id: <c12d7c9c-8212-ba9b-252f-7dbb61698550@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190325212523.11799-1-pakki001@umn.edu>
 <f2960ada-7e06-33d1-1533-78989a3e1d2a@web.de>
 <20191011133557.GF2819@lahna.fi.intel.com>
In-Reply-To: <20191011133557.GF2819@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org
Cc: Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, linux-kernel@vger.kernel.org

>> This source code analysis approach points out that the implementation
>> of the function “icm_handle_event” contains still an unchecked call
>> of the function “kmemdup”.
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/thunderbolt/icm.c?id=3cdb9446a117d5d63af823bde6fe6babc312e77b#n1627
>> https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/thunderbolt/icm.c#L1627
>
> Right it misses that.

Thanks for your quick feedback.


> Feel free to send a patch fixing it ;-) Or I can do that myself.

Would you like to reconsider also the addition of the function call
“tb_sw_warn(sw, "cannot allocate memory for switch\n")”?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=9e208aa06c2109b45eec6be049a8e47034748c20#n878

Regards,
Markus
