From: Wim de With <nauxuron@wimdewith.com>
Date: Tue, 19 May 2015 15:26:21 +0000
Subject: Re: Breaking lines in function headers
Message-Id: <555B561D.7050006@wimdewith.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <555B3901.3090707@wimdewith.com>
In-Reply-To: <555B3901.3090707@wimdewith.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 19-5-2015 17:20, Dan Carpenter wrote:
> On Tue, May 19, 2015 at 05:14:49PM +0200, Wim de With wrote:
>> On 19-5-2015 16:08, Dan Carpenter wrote:
>>> First of gmail always marks your emails as spam so I only see the
>>> replies.
>>
>> That might be because of my SPF/DMARC configuration. I think it's fixed now.
>>
>>> Both declaration formats are acceptable.
>>>
>>> These days instead of "substantially to the right" most people
>>> insist that they be aligned.  I think checkpatch.pl --strict enforces
>>> this.
>>
>> So as long as I use the same style consistently in a source file, I'm good?
>>
> 
> I'm slightly confused what you mean.  If you're asking if you should
> redo the visorchipset.c patch then don't bother with that.  The original
> code is fine.
> 
> regards,
> dan carpenter 

Yeah, I realized that already, but I saw some other files in
drivers/staging that had lines over 80 characters long, so I just wanted
to know how to do it correctly the next time I submit a patch like that.

Wim
