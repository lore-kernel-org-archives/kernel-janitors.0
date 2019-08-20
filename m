From: Shuah Khan <skhan@linuxfoundation.org>
Date: Tue, 20 Aug 2019 00:17:02 +0000
Subject: Re: [Linux-kernel-mentees] [PROJECT] clean up swapcache use of struct page
Message-Id: <f69a2e2e-ec21-efd6-4787-59f1c77885b3@linuxfoundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190819235456.GA9657@bombadil.infradead.org>
In-Reply-To: <20190819235456.GA9657@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Matthew,

On 8/19/19 5:54 PM, Matthew Wilcox wrote:
> 
> This would be a good project for someone with a little experience and
> a lot of attention to detail.
> 
> The struct page is probably the most abused data structure in the kernel,
> and for good reason.  But some of the abuse is unnecessary ... a mere
> historical accident that would be better fixed.
> 
> Page cache pages use page->mapping and page->index to indicate which file
> the page belongs to and where in that file it is.  page->private may be
> used by the filesystem for its own purposes (eg buffer heads).
> 
> Anonymous pages use page->mapping to point to the anon VMA they belong
> to and page->index to record the offset within the VMA.  Then, if they
> are also part of the swap cache, they use page->private to record both
> the offset within the swap device and the index of the page within the
> swap device.
> 
> Then we get abominations like:
> 
> static inline pgoff_t page_index(struct page *page)
> {
>          if (unlikely(PageSwapCache(page)))
>                  return __page_file_index(page);
>          return page->index;
> }
> 
> My modest proposal for deleting the first two lines of that function is
> to first switch the uses of page->private and page->index for anonymous
> pages.  Then move the swp_type() back from page->index to page->private
> again [1].
> 
> I am willing to review patches and provide feedback.  I can go into more
> detail about how I think this should be tackled if there's interest.
> Also, if you know more than I do about the MM and think this is a bad
> idea, please do say ;-)
> 

I will be happy to add it to the project list for Spring session.

We can work together to come up with a task list to get the candidates
up to speed during the application process period which starts on Nov 1st.

> This is going to be a tough project because there are a lot of
> rarely-tested paths which directly reference (eg) page->index, and they
> might be talking about a page cache page or a swap page.  This is not
> a simple Coccinelle script.

Yes mm isn't an easy area especially for new developers. We can work
together to come up with a task list to get the candidates up to speed
during the application process period which starts on Nov 1st.

> 
> [1] We have enough bits to do this; on a 32-bit machine, we can at most
> have a VMA which covers 4GB memory and with a 4kB page size, that's only
> 20 bits needed to encode all possible offsets within a VMA).

That being said, I will wait for other mm experts weigh in.

thanks,
-- Shuah
