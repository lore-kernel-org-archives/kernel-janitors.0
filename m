From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Nov 2020 14:02:59 +0000
Subject: Re: [PATCH] hwmon: (applesmc) Fix smc_sane() function
Message-Id: <20201117140259.GG18329@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201117072401.GE1111239@mwanda>
 <5000a18a-1aa1-e9b0-c51a-80f65654c65b@fnarfbargle.com>
In-Reply-To: <5000a18a-1aa1-e9b0-c51a-80f65654c65b@fnarfbargle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brad Campbell <brad@fnarfbargle.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Nov 17, 2020 at 08:58:47PM +1100, Brad Campbell wrote:
> On 17/11/20 6:24 pm, Dan Carpenter wrote:
> > This test is reversed so the function will return without sending
> > the APPLESMC_READ_CMD or completing the rest of the function.
> 
> That is as designed. The routine looks at the busy line and if it's
> already in the right state then it simply ends. If not then it tries
> to "re-align" the state machine by sending a new command.

Ah.  Ok.  It looked like a typo.  These "if (!ret) return ret;" typos
are surprisingly common so I review them every time they are added.
It's a static analysis warning, that I haven't published.  I kind of
feel like it would be more clearly intentional if it were written like
so:

	ret = wait_status(0, SMC_STATUS_BUSY);
	if (!ret)
		return 0;

But I try not to get too bogged down with style so let's leave it.

regards,
dan carpenter
