From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 01 Oct 2004 20:10:31 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2 2/33] char/cyclades: replace
Message-Id: <20041001201031.GB2110@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48555400677345117=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040915212155.GG5778@us.ibm.com>
In-Reply-To: <20040915212155.GG5778@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============48555400677345117==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 30, 2004 at 01:48:18PM -0300, Marcelo Tosatti wrote:
> Well have to convert from jiffies (char_time) to msecs, just to 
> convert it back again to jiffies in msleep_interruptible().
> 
> Is this patch actually fixing any problem?

So there are a few things here:

1) I think the overhead of the conversions is very small in comparison
with the eventual call to schedule() and such, so I don't think it's
that big of a deal -- *please* correct me if I am wrong, though.

2) I am currently trying to determine if it might be possible for the
timeout value (char_time, and I guess by extension, timeout) to be
expressed in milliseconds instead of jiffies. If you have any input on
that, Marcelo (or anyone from the list), I would really appreciate it.

-Nish

--===============48555400677345117==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48555400677345117==--
