From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jan 2020 16:27:36 +0000
Subject: syzbot is quite fun
Message-Id: <20200114162736.GD3719@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Everyone,

I joined the syzbot mailing list last week.  It seems quite fun.

I'm puzzling over this one right now.

https://syzkaller.appspot.com/bug?extid=9A48339b077c5a80b869

Notice the kernel is 5.5.0-rc3-syzkaller (git checkout v5.5-rc3).

  1801  static int uvc_scan_device(struct uvc_device *dev)
  1802  {
  1803          struct uvc_video_chain *chain;
  1804          struct uvc_entity *term;
  1805 =20
  1806          list_for_each_entry(term, &dev->entities, list) {
  1807                  if (!UVC_ENTITY_IS_OTERM(term))
  1808                          continue;
  1809 =20
  1810                  /* If the terminal is already included in a chain, =
skip it.
  1811                   * This can happen for chains that have multiple ou=
tput
  1812                   * terminals, where all output terminals beside the=
 first one
  1813                   * will be inserted in the chain in forward scans.
  1814                   */
  1815                  if (term->chain.next || term->chain.prev)
  1816                          continue;
  1817 =20
  1818                  chain =3D uvc_alloc_chain(dev);
  1819                  if (chain =3D NULL)
  1820                          return -ENOMEM;
  1821 =20
  1822                  term->flags |=3D UVC_ENTITY_FLAG_DEFAULT;
  1823 =20
  1824                  if (uvc_scan_chain(chain, term) < 0) {
  1825                          kfree(chain);
                                      ^^^^^
Somehow this "chain" is used after it has been freed.  That doesn't
seem possible because uvc_scan_chain() doesn't store any reference to
it.

  1826                          continue;
  1827                  }
  1828 =20
  1829                  uvc_trace(UVC_TRACE_PROBE, "Found a valid video cha=
in (%s).\n",
  1830                            uvc_print_chain(chain));
  1831 =20
  1832                  list_add_tail(&chain->list, &dev->chains);
  1833          }

Its like solving a puzzle.  Reviewing code skills etc.

regards,
dan carpenter
