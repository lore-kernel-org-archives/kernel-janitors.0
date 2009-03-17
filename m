From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 17 Mar 2009 14:27:29 +0000
Subject: Re: [PATCH v2 06/15] NULL noise: drivers/mtd/tests/mtd_*test.c
Message-Id: <49BFB351.6020301@nokia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
	<20090305191457.30062.43881.stgit@f10box.hanneseder.net>
	<49B0BE07.5080803@nokia.com>
	<alpine.LNX.2.00.0903171421200.11733@jikos.suse.cz>
In-Reply-To: <alpine.LNX.2.00.0903171421200.11733@jikos.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jiri Kosina <jkosina@suse.cz>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Hannes Eder <hannes@hanneseder.net>, "trivial@kernel.org" <trivial@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org

Jiri Kosina wrote:
>>>   drivers/mtd/tests/mtd_oobtest.c:673:41: warning: Using plain integer as
>>> NULL pointer
>>>   drivers/mtd/tests/mtd_oobtest.c:701:33: warning: Using plain integer as
>>> NULL pointer
>>>   drivers/mtd/tests/mtd_readtest.c:74:41: warning: Using plain integer as
>>> NULL pointer
>>>
>>> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
>>> Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>> Yes, please, take this patch.
> 
> Doesn't seem to be present in current -next/-mmotim, applied to trivial
> tree.

Fine with me. (CCed linux-mtd).

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
