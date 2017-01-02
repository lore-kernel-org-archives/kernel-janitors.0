From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Mon, 02 Jan 2017 14:54:21 +0000
Subject: Re: [PATCH 0/8] [media] v4l2-core: Fine-tuning for some function implementations
Message-Id: <b804f4dd-392e-ae8e-41de-a02260fef550@xs4all.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9268b60d-08ba-c64e-1848-f84679d64f80@users.sourceforge.net>
 <20161227115111.GN16630@valkosipuli.retiisi.org.uk>
In-Reply-To: <20161227115111.GN16630@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sakari Ailus <sakari.ailus@iki.fi>, SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-media@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Jan Kara <jack@suse.cz>, Javier Martinez Canillas <javier@osg.samsung.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lorenzo Stoakes <lstoakes@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Hocko <mhocko@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 12/27/16 12:51, Sakari Ailus wrote:
> Hi Markus,
>
> On Mon, Dec 26, 2016 at 09:41:19PM +0100, SF Markus Elfring wrote:
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Mon, 26 Dec 2016 21:30:12 +0100
>>
>> Some update suggestions were taken into account
>> from static source code analysis.
>>
>> Markus Elfring (8):
>>   v4l2-async: Use kmalloc_array() in v4l2_async_notifier_unregister()
>>   v4l2-async: Delete an error message for a failed memory allocation in v4l2_async_notifier_unregister()
>>   videobuf-dma-sg: Use kmalloc_array() in videobuf_dma_init_user_locked()
>>   videobuf-dma-sg: Adjust 24 checks for null values
>>   videobuf-dma-sg: Move two assignments for error codes in __videobuf_mmap_mapper()
>>   videobuf-dma-sg: Improve a size determination in __videobuf_mmap_mapper()
>>   videobuf-dma-sg: Delete an unnecessary return statement in videobuf_vm_close()
>>   videobuf-dma-sg: Add some spaces for better code readability in videobuf_dma_init_user_locked()
>
> I don't really disagree with the videobuf changes as such --- the original
> code sure seems quite odd, but I wonder whether we want to do this kind of
> cleanups in videobuf. Videobuf will be removed likely in not too distant
> future; when exactly, Hans can guesstimate better than me. Cc him.
>

The videobuf code is frozen as far as I am concerned, and I won't pick up
these cleanup patches. While they look perfectly reasonable, I don't want
to risk any breakage there. The last thing I want to do is to have to debug
in the videobuf code.

Sorry Markus, just stay away from the videobuf-* sources.

Regards,

	Hans
