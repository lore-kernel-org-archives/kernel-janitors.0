From: Dan Carpenter <error27@gmail.com>
Date: Tue, 08 Jun 2010 20:35:21 +0000
Subject: Re: [patch 4/7] selinux: fix error codes in cond_read_node()
Message-Id: <20100608203521.GC5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100607210703.GT5483@bicker>
In-Reply-To: <20100607210703.GT5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Jun 08, 2010 at 04:19:18PM -0400, Eric Paris wrote:
> > + =A0 =A0 =A0 rc =3D cond_read_av_list(p, fp, &node->false_list, node->=
true_list);
> > + =A0 =A0 =A0 if (rc < 0)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;
>=20
> I know that lots of the next_entry() calls use if (rc < 0) [unrelated
> note I think those need to be fixed too] but most of the code uses if
> (rc) and I strongly prefer if (rc) as it's cleaner and faster from a
> micro architecture point of view.  Would you mind re-spinning this
> one?
>=20
> -Eric

The thing I like about if (rc < 0) is that it's makes it explicit that
we expect negative error values.  My gut says this will make it easier
for static checkers to track what the value of "rc" is.

But I don't have strong feelings about this.

I'll resend the whole set tomorrow or the next day with all the changes
you suggested.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
