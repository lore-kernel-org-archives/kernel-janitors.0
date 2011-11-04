From: Jimmy Pan <dspjm1@gmail.com>
Date: Fri, 04 Nov 2011 15:27:44 +0000
Subject: How to refer to the unamed structure in page struct
Message-Id: <CAAgJb5utHS9f_SyfH7vp2x+S68REyePVsjBO2SqfMBo4gmFczQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernelnewbies@lists.kernelnewbies.org

truct page {
        unsigned long flags;            /* Atomic flags, some possibly
                                         * updated asynchronously */
        atomic_t _count;                /* Usage count, see below. */
        union {
                atomic_t _mapcount;     /* Count of ptes mapped in mms,
                                         * to show when page is mapped
                                         * & limit reverse map searches.
                                         */
                struct {                /* SLUB */
                        u16 inuse;
                        u16 objects;
                };
        };
        union {
            struct {
                unsigned long private;          /* Mapping-private opaque d=
ata:
                                                 * usually used for buffer_=
heads
                                                 * if PagePrivate set; used=
 for
                                                 * swp_entry_t if PageSwapC=
ache;
                                                 * indicates order in the b=
uddy
                                                 * system if PG_buddy is se=
t.
                                                 */
                struct address_space *mapping;  /* If low bit clear, points=
 to
                                                 * inode address_space, or =
NULL.
                                                 * If page mapped as anonym=
ous
                                                 * memory, low bit is set, =
and
                                                 * it points to anon_vma ob=
ject:
                                                 * see PAGE_MAPPING_ANON be=
low.
                                                 */
            };
#if USE_SPLIT_PTLOCKS
            spinlock_t ptl;
#endif
            struct kmem_cache *slab;    /* SLUB: Pointer to slab */
            struct page *first_page;    /* Compound tail pages */
        };



-------------------------------------------------------------------------
As you can see in the code=EF=BC=8C the union in the page structure doesn't
have a name, so does
the structure in the union, how to refer to those two?

Thanks in advance,
Jimmy
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
