From: Marcelo Tosatti <marcelo.tosatti@cyclades.com>
Date: Fri, 01 Oct 2004 19:07:04 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2 2/33] char/cyclades: replace
Message-Id: <20041001190704.GB4372@logos.cnet>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58822963744751799=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040915212155.GG5778@us.ibm.com>
In-Reply-To: <20040915212155.GG5778@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============58822963744751799==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 01, 2004 at 01:10:31PM -0700, Nishanth Aravamudan wrote:
> On Thu, Sep 30, 2004 at 01:48:18PM -0300, Marcelo Tosatti wrote:
> > Well have to convert from jiffies (char_time) to msecs, just to 
> > convert it back again to jiffies in msleep_interruptible().
> > 
> > Is this patch actually fixing any problem?
> 
> So there are a few things here:
> 
> 1) I think the overhead of the conversions is very small in comparison
> with the eventual call to schedule() and such, so I don't think it's
> that big of a deal -- *please* correct me if I am wrong, though.

No you are right the overhead is very small - I'm just trying
to find a good reason to apply the change.

> 2) I am currently trying to determine if it might be possible for the
> timeout value (char_time, and I guess by extension, timeout) to be
> expressed in milliseconds instead of jiffies. If you have any input on
> that, Marcelo (or anyone from the list), I would really appreciate it.

I do not like the idea very much. 

I mean, what is the problem with that piece of code right now?

ie please educate me about msleep_interruptible()



--===============58822963744751799==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58822963744751799==--
