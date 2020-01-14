From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 14 Jan 2020 16:36:35 +0000
Subject: Re: syzbot is quite fun
Message-Id: <42e18a51-5cc3-addd-00c7-524ee5c13123@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200114162736.GD3719@kadam>
In-Reply-To: <20200114162736.GD3719@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Thanks for the heads-up about the mailing list. I've been toying with
syzbot myself and created a repo that sets up and runs it for me
automatically:

https://github.com/ColinIanKing/syzkaller-script

I've not found any issues yet; skzkaller is like bitcoin mining, lots of
compute with occasional wins.

Colin

On 14/01/2020 16:27, Dan Carpenter wrote:
> Hi Everyone,
>=20
> I joined the syzbot mailing list last week.  It seems quite fun.
>=20
> I'm puzzling over this one right now.
>=20
> https://syzkaller.appspot.com/bug?extid=9A48339b077c5a80b869
>=20
> Notice the kernel is 5.5.0-rc3-syzkaller (git checkout v5.5-rc3).
>=20
>   1801  static int uvc_scan_device(struct uvc_device *dev)
>   1802  {
>   1803          struct uvc_video_chain *chain;
>   1804          struct uvc_entity *term;
>   1805 =20
>   1806          list_for_each_entry(term, &dev->entities, list) {
>   1807                  if (!UVC_ENTITY_IS_OTERM(term))
>   1808                          continue;
>   1809 =20
>   1810                  /* If the terminal is already included in a chain=
, skip it.
>   1811                   * This can happen for chains that have multiple =
output
>   1812                   * terminals, where all output terminals beside t=
he first one
>   1813                   * will be inserted in the chain in forward scans.
>   1814                   */
>   1815                  if (term->chain.next || term->chain.prev)
>   1816                          continue;
>   1817 =20
>   1818                  chain =3D uvc_alloc_chain(dev);
>   1819                  if (chain =3D NULL)
>   1820                          return -ENOMEM;
>   1821 =20
>   1822                  term->flags |=3D UVC_ENTITY_FLAG_DEFAULT;
>   1823 =20
>   1824                  if (uvc_scan_chain(chain, term) < 0) {
>   1825                          kfree(chain);
>                                       ^^^^^
> Somehow this "chain" is used after it has been freed.  That doesn't
> seem possible because uvc_scan_chain() doesn't store any reference to
> it.
>=20
>   1826                          continue;
>   1827                  }
>   1828 =20
>   1829                  uvc_trace(UVC_TRACE_PROBE, "Found a valid video c=
hain (%s).\n",
>   1830                            uvc_print_chain(chain));
>   1831 =20
>   1832                  list_add_tail(&chain->list, &dev->chains);
>   1833          }
>=20
> Its like solving a puzzle.  Reviewing code skills etc.
>=20
> regards,
> dan carpenter
>=20
