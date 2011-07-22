From: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 22 Jul 2011 18:14:15 +0000
Subject: Re: Question about submitting patches
Message-Id: <20110722111415.3896be5c.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAB2gnbW=umjGrVH6Bi6+hoUN6w1J0ZzefMhSueSicz6NKGE=xQ@mail.gmail.com>
In-Reply-To: <CAB2gnbW=umjGrVH6Bi6+hoUN6w1J0ZzefMhSueSicz6NKGE=xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 22 Jul 2011 11:03:57 -0600 Noah Watkins wrote:

> Pardon the newbie question here, this email is in reference to two
> additional emails that I just sent to janitors list:
> 
>   [PATCH 1/2] zram: make global var "devices" use unique name
>   [PATCH 2/2] zram: make global var "num_devices" use unique name
> 
> Originally I had submitted these patches to Nitin Gupta (zram guy),
> Greg KH, and linux-next
> 
> I didn't receive a response, but then realized I didn't actually know
> what to expect. I checked out all the relevant docs on submitting

Some maintainers reply when they merge a patch and some don't.
GregKH usually does, but with a time lag of up to roughly 1 week.

> patches, but it all seems a bit nebulous still. Does this submission
> look OK?

Do those variable names currently cause a problem?
They are not static, but they also are not exported symbols [EXPORT_SYMBOL()].

Do these patches fix any reported warnings?  If so, you should include those
warning messages and what tool reported them.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
