From: matt mooney <mfm@muteddisk.com>
Date: Tue, 18 May 2010 23:15:58 +0000
Subject: Re: [PATCH 1/3 v2] kbuild/makefiles.txt: Fix examples and content
Message-Id: <20100518231558.GD8700@haskell.muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273603385-20587-1-git-send-email-mfm@muteddisk.com>
 <20100512043038.GB5358@cr0.nay.redhat.com>
In-Reply-To: <20100512043038.GB5358@cr0.nay.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: =?iso-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong@gmail.com>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, mec@shout.net, kai@tp1.ruhr-uni-bochum.de, sam@ravnborg.org, jengelh@gmx.de

Hi Randy,=20

Should I resubmit these and include the main list? Or just forget about
them?=20

Thanks,
matt

On 12:30 Wed 12 May     , Am=E9rico Wang wrote:
> On Tue, May 11, 2010 at 11:43:05AM -0700, matt mooney wrote:
> >
> >Update section 3.3 Loadable module goals - obj-m, from $(<module_name>-o=
bjs) to $(<module_name>-y) for easier addition of conditional objects to th=
e module. The examples are also updated to reflect the current state of eac=
h Makefile used.
> >
> >Signed-off-by: matt mooney <mfm@muteddisk.com>
>=20
>=20
> The whole patchset looks good to me, so,
>=20
> Reviewed-by: WANG Cong <xiyou.wangcong@gmail.com>
>=20
> But note that I am not a native English-speaker, let's
> see what Randy will say.
>=20
> Thanks.
>=20
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
