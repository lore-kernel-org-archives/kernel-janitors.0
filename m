From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Wed, 18 Mar 2015 13:43:01 +0000
Subject: Re: [PATCH v2] Staging: dgnc: release the lock before testing for nullity
Message-Id: <550980E5.8080001@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426684868-24402-1-git-send-email-lambert.quentin@gmail.com> <20150318133651.GS10964@mwanda>
In-Reply-To: <20150318133651.GS10964@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lidza Louina <lidza.louina@gmail.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 18/03/2015 14:36, Dan Carpenter wrote:
> This changelog still doesn't make sense so I took a look at the code.
>
> tty_ldisc_deref() is an unlock function.  So this is a lock ordering
> bug.  What makes you think the original ordering was correct?  Who
> reported this bug?  What are the effects of this bug?
I was the one who introduced the ordering change in the first place.
I am just trying to fix it because although nobody complained I am not
sure of the impact and restoring the previous control flow seems to be the
right thing to do.
