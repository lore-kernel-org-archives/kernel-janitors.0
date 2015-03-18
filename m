From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Mar 2015 14:03:03 +0000
Subject: Re: [PATCH v2] Staging: dgnc: release the lock before testing for nullity
Message-Id: <20150318140302.GT10964@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426684868-24402-1-git-send-email-lambert.quentin@gmail.com>
 <20150318133651.GS10964@mwanda>
 <550980E5.8080001@gmail.com>
 <20150318135402.GU16501@mwanda>
 <550984AE.5030802@gmail.com>
In-Reply-To: <550984AE.5030802@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: devel@driverdev.osuosl.org, Lidza Louina <lidza.louina@gmail.com>, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I don't know anyone with this hardware who can test a patch.  If you
find someone then you should send a patch to reorder the other original
unlock and deref.

Otherwise, I would just leave it alone for now.

regards,
dan carpenter

