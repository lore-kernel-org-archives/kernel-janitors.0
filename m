From: Glauber Costa <glommer@parallels.com>
Date: Tue, 02 Oct 2012 09:17:46 +0000
Subject: Re: [glommer-memcg:slab-common/kmalloc 28/30] include/linux/slab_def.h:135:27: warning: array subscr
Message-Id: <506AB13A.4070807@parallels.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928102032.GA29995@localhost>
In-Reply-To: <20120928102032.GA29995@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/01/2012 09:55 PM, Christoph Lameter wrote:
> On Sat, 29 Sep 2012, Fengguang Wu wrote:
> 
>> On Fri, Sep 28, 2012 at 06:17:20PM +0000, Christoph Lameter wrote:
>>> On Fri, 28 Sep 2012, Fengguang Wu wrote:
>>>
>>>> commit: 55a6b9f968a877c728ed6e438fa68741a7711d89 [28/30] CK1 [12/13] Common names for the array of kmalloc caches
>>>
>>> Is this issue really caused by the specified commit? I do not see how the
>>> patch can cause such a problem.
>>
>> It should be a wrong bisection. Sorry. I checked manually and find
>> that the previous commit stopped early at this error:
>>
>> In file included from /c/kernel-tests/src/next/include/linux/slab.h:309:0,
>>                  from /c/kernel-tests/src/next/include/linux/proc_fs.h:4,
>>                  from /c/kernel-tests/src/next/fs/proc/stat.c:6:
>> /c/kernel-tests/src/next/include/linux/slab_def.h: In function 'kmalloc':
>> /c/kernel-tests/src/next/include/linux/slab_def.h:132:13: error: 'kmalloc_dma_caches' undeclared (first use in this function)
>> /c/kernel-tests/src/next/include/linux/slab_def.h:132:13: note: each undeclared identifier is reported only once for each function it appears in
>> /c/kernel-tests/src/next/include/linux/slab_def.h:135:13: error: 'kmalloc_caches' undeclared (first use in this function)
>>
>> Thus the warning was "hide" until the current commit:
>>
>> In file included from /c/kernel-tests/src/next/include/linux/slab.h:314:0,
>>                  from /c/kernel-tests/src/next/include/linux/proc_fs.h:4,
>>                  from /c/kernel-tests/src/next/fs/proc/stat.c:6:
>> /c/kernel-tests/src/next/fs/proc/stat.c: In function 'stat_open':
>> /c/kernel-tests/src/next/include/linux/slab_def.h:135:27: warning: array subscript is above array bounds [-Warray-bounds]
> 
> Ok there were some fixes in that area in V2. Could we try again and see if
> the new version fixes it?
> 
I plan to upload a version with your new patches shortly. Sorry, I am
trying to get a new version of my memcg-slab series with your feedback
incorporated as soon as I can, so I was a bit slow with review yesterday
in general.


