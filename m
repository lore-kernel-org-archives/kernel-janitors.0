From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jun 2012 06:06:48 +0000
Subject: Re: [Q] Cleaning string whitespace trimming. Does it make any sense?
Message-Id: <20120613060648.GR13539@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
In-Reply-To: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Jun 12, 2012 at 07:03:04PM -0300, Ezequiel Garcia wrote:
> On Tue, Jun 12, 2012 at 5:58 PM, Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
> > Actually, on second thought strim() already does what we want. =A0Just
> > ignore the return value.
> >
>=20
> But it could make sense to fix such redundant code?
>=20

Yep.

> I'm unsure what git tree should I base the patches, given
> I'd be touching all over the place. Perhaps linux-next?

Yep.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
