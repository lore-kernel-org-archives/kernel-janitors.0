From: Joe Perches <joe@perches.com>
Date: Mon, 19 May 2014 17:35:28 +0000
Subject: Re: [PATCH] net: vxge: Use time_is_before_jiffies() for time comparison
Message-Id: <1400520928.30820.23.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400518056-12089-1-git-send-email-manuel.schoelling@gmx.de>
	 <1400518318-12386-1-git-send-email-manuel.schoelling@gmx.de>
	 <1400518318-12386-2-git-send-email-manuel.schoelling@gmx.de>
In-Reply-To: <1400518318-12386-2-git-send-email-manuel.schoelling@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Manuel =?ISO-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2014-05-19 at 18:51 +0200, Manuel Sch=F6lling wrote:
> To be future-proof and for better readability the time comparisons are mo=
dified
> to use time_is_before_jiffies() instead of plain, error-prone math.

Hi again Manuel.

Just a couple of FYIs/nits:

The "net: " prefix in your patch subject is a little
misleading.  One reading might be that the patch is
to the net/ subsystem but it's for a driver.

It might be better as:

[PATCH] vxge: Use time_is_before_jiffies

Generally, just use the last directory name
for the subject prefix.

ie:  patching: foo/bar/baz/qux.c

subject prefix is generally:

[PATCH] baz: whatever changed...

and a single patch to a number of different files
in foo/bar/baz/*.[ch] is still

[PATCH] baz: etc...

Also, the time_is_(before|after)_jiffies variants
are not used particularly often in the kernel.

The form using of time_<foo>(jiffies, ...)
is used _far_ more often (and it saves a little
typing too).

time_before(<foo>, jiffies)
time_is_before_jiffies(<foo>)

$ git grep -E -w "time_is_(before|after|before_eq|after_eq)_jiffies" | wc -l
93
$ git grep -E "\btime_(before|after|before_eq|after_eq)+\s*\(.*jiffies" | w=
c -l
1695

<shrug>  Maybe there's some reading clarity using
the time_is_(before|after)_jiffies variants.


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
