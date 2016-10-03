From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 03 Oct 2016 12:12:39 +0000
Subject: Re: virtio_blk: Rename a jump label in virtblk_get_id()
Message-Id: <051e7718-b5bb-e716-b2c0-515ee4488c4a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <02054675-8395-ac81-6863-e3a5cbfc9032@users.sourceforge.net>
 <a303f7a6-c675-5228-99bd-a03c9e9252e9@users.sourceforge.net>
 <CAJSP0QV2WUJPqeiSKcWiXWk+AoJ2MGo2zG4=JQ2tfpTprAyV=g@mail.gmail.com>
In-Reply-To: <CAJSP0QV2WUJPqeiSKcWiXWk+AoJ2MGo2zG4=JQ2tfpTprAyV=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Linux Virtualization <virtualization@lists.linux-foundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>> Adjust a jump label according to the current Linux coding style convention.
> 
> I think you mean "goto label".  "Jump label" has a different meaning,
> see <linux/jump_label.h>.

Does a "goto" statement jump to the code position finally
which is specified by the label?


>> @@ -247,10 +247,10 @@ static int virtblk_get_id(struct gendisk *disk, char *id_str)
>>
>>         err = blk_rq_map_kern(q, req, id_str, VIRTIO_BLK_ID_BYTES, GFP_KERNEL);
>>         if (err)
>> -               goto out;
>> +               goto put_request;
>>
>>         err = blk_execute_rq(vblk->disk->queue, vblk->disk, req, false);
>> -out:
>> + put_request:
> 
> I checked Documentation/CodingStyle and see no reason to rename the label.

Can the suggested longer identifier explain better the "what" and "why"
for this software situation?


> It's also not clear why you added a space.  The CodingStyle example
> does not use a space before the label.

Do you find information from a commit like "docs: Remove space-before-label guidance
from CodingStyle" (from 2016-09-21) interesting?   ;-)
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/Documentation/CodingStyle?idyc70c304b0b443429b2a0019518532c5162817a

Regards,
Markus
