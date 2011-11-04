From: Dave Hylands <dhylands@gmail.com>
Date: Fri, 04 Nov 2011 19:01:49 +0000
Subject: Re: How to refer to the unamed structure in page struct
Message-Id: <CABi1daFJ6e6igT18FQNhBCGmvsi9r=w9GYuK53DxOegnuS=78g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAAgJb5utHS9f_SyfH7vp2x+S68REyePVsjBO2SqfMBo4gmFczQ@mail.gmail.com>
	<CABi1daFTGm=47Kwt_oevENR4eTYs4Ffvx1yiyscUJ91epO4Wyw@mail.gmail.com>
	<CAAgJb5tuCPX0S=2Eb1pARqhhcOMtATPR4nRHb6mkYRSShPGLEw@mail.gmail.com>
In-Reply-To: <CAAgJb5tuCPX0S=2Eb1pARqhhcOMtATPR4nRHb6mkYRSShPGLEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernelnewbies@lists.kernelnewbies.org

Hi Jimmy,

On Fri, Nov 4, 2011 at 9:28 AM, Jimmy Pan <dspjm1@gmail.com> wrote:
> On Sat, Nov 5, 2011 at 12:00 AM, Dave Hylands <dhylands@gmail.com> wrote:
>> Hi Jimmy,
>>
>> On Fri, Nov 4, 2011 at 8:27 AM, Jimmy Pan <dspjm1@gmail.com> wrote:
>>> truct page {
>>> =A0 =A0 =A0 =A0unsigned long flags; =A0 =A0 =A0 =A0 =A0 =A0/* Atomic fl=
ags, some possibly
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 * updated asynchronously */
>>> =A0 =A0 =A0 =A0atomic_t _count; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Usage=
 count, see below. */
>>> =A0 =A0 =A0 =A0union {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0atomic_t _mapcount; =A0 =A0 /* Count of =
ptes mapped in mms,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 * to show when page is mapped
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 * & limit reverse map searches.
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 */
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
/* SLUB */
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u16 inuse;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u16 objects;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
>>> =A0 =A0 =A0 =A0};
>>> =A0 =A0 =A0 =A0union {
>>> =A0 =A0 =A0 =A0 =A0 =A0struct {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long private; =A0 =A0 =A0 =A0 =
=A0/* Mapping-private opaque data:
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 * usually used for buffer_heads
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 * if PagePrivate set; used for
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 * swp_entry_t if PageSwapCache;
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 * indicates order in the buddy
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 * system if PG_buddy is set.
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 */
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct address_space *mapping; =A0/* If =
low bit clear, points to
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 * inode address_space, or NULL.
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 * If page mapped as anonymous
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 * memory, low bit is set, and
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 * it points to anon_vma object:
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 * see PAGE_MAPPING_ANON below.
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 */
>>> =A0 =A0 =A0 =A0 =A0 =A0};
>>> #if USE_SPLIT_PTLOCKS
>>> =A0 =A0 =A0 =A0 =A0 =A0spinlock_t ptl;
>>> #endif
>>> =A0 =A0 =A0 =A0 =A0 =A0struct kmem_cache *slab; =A0 =A0/* SLUB: Pointer=
 to slab */
>>> =A0 =A0 =A0 =A0 =A0 =A0struct page *first_page; =A0 =A0/* Compound tail=
 pages */
>>> =A0 =A0 =A0 =A0};
>>
>> You just reference the variable as if the unnamed union weren't there
>> (i.e. just like unnamed unions in C++).
>>
>> Here's an example from the kernel source tree:
>> http://lxr.linux.no/linux+v3.1/include/linux/mm.h#L419

> Well, I see, but what is the use of the union and structure?

Unions and structures are basic elements of the C language.
http://en.wikipedia.org/wiki/Union_(computer_science)
http://publications.gbdirect.co.uk/c_book/chapter6/unions.html

--=20
Dave Hylands
Shuswap, BC, Canada
http://www.davehylands.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
