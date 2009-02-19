From: CityK <cityk@rogers.com>
Date: Thu, 19 Feb 2009 00:52:43 +0000
Subject: Re: [PATCH] V4L: Storage class should be before const qualifier
Message-Id: <499CAD5B.9010106@rogers.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090209210649.GA7378@xenon.distanz.ch> <alpine.LNX.1.10.0902161353150.18110@jikos.suse.cz> <4999AAB6.4090904@rogers.com> <alpine.LNX.1.10.0902170313310.18110@jikos.suse.cz>
In-Reply-To: <alpine.LNX.1.10.0902170313310.18110@jikos.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>
Cc: Tobias Klauser <tklauser@distanz.ch>, mchehab@infradead.org, linux-media@vger.kernel.org, video4linux-list@redhat.com, kernel-janitors@vger.kernel.org, trivial@kernel.org

Jiri Kosina wrote:
> On Mon, 16 Feb 2009, CityK wrote:
>
>   
>>>> .... [inline patch] ....
>>>>         
>>> This doesn't seem to be picked by anyone for current -next/-mmotm, I have
>>> applied it to trivial tree. Thanks,
>>>       
>> Will this create any complication? As it is indeed queued in our
>> patchwork: http://patchwork.kernel.org/project/linux-media/list/
>>     
>
> Hmm, patchwork ... did this land in any actual code tree? It has been 
> submitted by Tobias on 9th Feb and I was not able to find it in any tree 
> today, so I applied to to trivial tree (to which the patch has been 
> originally CCed).
>
> If you guys actually have queued in some tree, please let me know and I 
> will drop it.

I'll defer to Mauro for the absolutes, but it looks like it got applied
to V4L-DVB mainline Hg yesterday and is in Mauro's Linux-next git.
