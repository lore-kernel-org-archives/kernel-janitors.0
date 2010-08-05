From: Dan Carpenter <error27@gmail.com>
Date: Thu, 05 Aug 2010 10:19:38 +0000
Subject: Re: [patch] isdn: fix information leak
Message-Id: <20100805101938.GH9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100805093806.GF9031@bicker> <AANLkTin4jtYuaxYfxDAgST857sD2K4Q28mPcPW=xd-V3@mail.gmail.com>
In-Reply-To: <AANLkTin4jtYuaxYfxDAgST857sD2K4Q28mPcPW=xd-V3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Changli Gao <xiaosuo@gmail.com>
Cc: Karsten Keil <isdn@linux-pingi.de>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 05, 2010 at 06:08:08PM +0800, Changli Gao wrote:
> On Thu, Aug 5, 2010 at 5:38 PM, Dan Carpenter <error27@gmail.com> wrote:
> > The main motivation of this patch changing strcpy() to strlcpy().
> > We strcpy() to copy a 48 byte buffers into a 49 byte buffers. =A0So at
> > best the last byte has leaked information, or maybe there is an
> > overflow? =A0Anyway, this patch closes the information leaks by zeroing
> > the memory and the calls to strlcpy() prevent overflows.
>=20
> strlcpy() can handle the terminator NUL. so you don't need to zero it.

If there are no NUL chars in "rcvmsg->msg_data.byte_array" then strlcpy()
is sufficient, but if there is a NUL character then you need to zero the
memory.  The patch handles both possibilities.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
