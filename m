From: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Fri, 11 Oct 2019 14:42:16 +0000
Subject: Re: [v3] thunderbolt: Fix to check the return value of kmemdup
Message-Id: <20191011144216.GI2819@lahna.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190325212523.11799-1-pakki001@umn.edu>
 <f2960ada-7e06-33d1-1533-78989a3e1d2a@web.de>
 <20191011133557.GF2819@lahna.fi.intel.com>
 <c12d7c9c-8212-ba9b-252f-7dbb61698550@web.de>
In-Reply-To: <c12d7c9c-8212-ba9b-252f-7dbb61698550@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, linux-kernel@vger.kernel.org

On Fri, Oct 11, 2019 at 04:13:22PM +0200, Markus Elfring wrote:
> Would you like to reconsider also the addition of the function call
> “tb_sw_warn(sw, "cannot allocate memory for switch\n")”?

For that I already have a patch as part of my USB4 support v2 series.
