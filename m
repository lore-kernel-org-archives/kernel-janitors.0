From: Oleg Drokin <green@linuxhacker.ru>
Date: Mon, 27 Apr 2015 15:36:33 +0000
Subject: Re: [PATCH 2/2] drm: fix a memleak on mutex failure path
Message-Id: <B7EF1F38-A474-4E07-95A6-252787D21A06@linuxhacker.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430025269-26243-1-git-send-email-green@linuxhacker.ru> <1430025269-26243-3-git-send-email-green@linuxhacker.ru> <87d22qc5lr.fsf@intel.com>
In-Reply-To: <87d22qc5lr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, "<kernel-janitors@vger.kernel.org>" <kernel-janitors@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Hello!

On Apr 27, 2015, at 4:56 AM, Jani Nikula wrote:

> On Sun, 26 Apr 2015, green@linuxhacker.ru wrote:
>> From: Oleg Drokin <green@linuxhacker.ru>
>> 
>> Need to free just allocated ctx allocation if we cannot
>> get our config mutex.
>> 
>> This one has been flagged by kbuild bot all the way back in August,
>> but somehow nobody picked it up:
>> https://lists.01.org/pipermail/kbuild/2014-August/001691.html
>> 
>> Found with smatch.
>> 
>> Signed-off-by: Oleg Drokin <green@linuxhacker.ru>
>> CC: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> The function has another leaking failure path, would be nice to have
> that fixed too. Maybe with a common out label.

Hm, you are right, there's another path, though it's less obvious since
what is done with ctx inside of those other calls, but apparently nothing
if there is an error, so it's also a leak.

I'll do an updated patch in a moment.

Bye,
    Oleg
