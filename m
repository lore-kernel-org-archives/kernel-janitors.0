From: "Kim, Milo" <Milo.Kim@ti.com>
Date: Mon, 28 Jan 2013 13:56:13 +0000
Subject: RE: [patch] lp8727_charger: small cleanup in naming
Message-Id: <A874F61F95741C4A9BA573A70FE3998F69E1EE6E@DQHE02.ent.ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130125154350.GA5908@elgon.mountain>
In-Reply-To: <20130125154350.GA5908@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> "pdata" and "pchg->pdata" are the same.  Changing the function call to
> pdata->get_batt_present() makes it match the check and it's a little
> cleaner.

Thanks!

Acked-by: Milo Kim <milo.kim@ti.com>
