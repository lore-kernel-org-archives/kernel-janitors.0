From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 May 2017 07:57:57 +0000
Subject: Re: qca_debug: Reduce function calls for sequence output in qcaspi_info_show()
Message-Id: <f9fef8a0-13c2-8dae-cb2a-7d39491e47f4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9932ee63-f766-49ce-d760-9a0bd06f0657@users.sourceforge.net>
 <290d2473-73bd-70db-b6ef-c50331812f31@i2se.com>
In-Reply-To: <290d2473-73bd-70db-b6ef-c50331812f31@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Wahren <stefan.wahren@i2se.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Philippe Reynes <tremyfr@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> The only benefit is a little bit higher performance.

I would prefer such a small code reduction. I am not so concerned
about an other readability impression at this place.


> But for debugfs this won't be necessary.

I would appreciate also another improvement there.

Regards,
Markus
