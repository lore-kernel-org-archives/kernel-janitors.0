From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 12 Sep 2017 17:54:45 +0000
Subject: Re: [PATCH] drm/vmwgfx: remove DRM_ERROR message, stops log spamming
Message-Id: <CACvgo53QktiPssai5hzoMP=Sy4Wtbrti+fOTHE4pGZXCZbUryA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170912173530.14132-1-colin.king@canonical.com>
 <211c7afe-c778-cf39-760a-05bc3a62e5db@vmware.com> <c4ed4d3c-7f6c-cb79-c213-cbbfae1377af@canonical.com>
In-Reply-To: <c4ed4d3c-7f6c-cb79-c213-cbbfae1377af@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, VMware Graphics <linux-graphics-maintainer@vmware.com>, Sinclair Yeh <syeh@vmware.com>, David Airlie <airlied@linux.ie>, ML dri-devel <dri-devel@lists.freedesktop.org>, kernel-janitors@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>

On 12 September 2017 at 18:47, Colin Ian King <colin.king@canonical.com> wrote:
> On 12/09/17 18:42, Thomas Hellstrom wrote:
>> Hi, Colin,
>>
>> On 09/12/2017 07:35 PM, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> mmap'ing the device multiple times will spam the kernel log with the
>>> DRM_ERROR message about illegal mmap'ing the old fifo space.
>> How are you hitting this? Multiple mappings should be fine as long as
>> mapping offsets are correct,
>> so hitting this message should indicate that the user-space app is doing
>> something seriously wrong, and
>> having it present in the log should probably help more than it hurts.
>>
>> /Thomas
>
> Good question.  I hit similar issues with the drm qxl driver when
> running some kernel regression tests with stress-ng [1]. I realize this
> is an artificial test scenario so it is definitely not a typical
> use-case, however, sync the illegal mmapping will return -EINVAL the
> application will pick up that this is an error without the need of
> spotting it in the kernel log. And a user space application can perform
> many millions of these invalid mmaps causing kernel log spamming.
>
FWIW I'm the one to "blame" here - pointing Colin to drop the message.

Two reasons come to mind:
 - there is a unwritten rule that roughly says "user input should not
cause kernel log spam"
 - out of all the DRM drivers only QXL and VMWGFX print a message,
with a patch addressing the former

HTH
Emil
