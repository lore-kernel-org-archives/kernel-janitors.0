From: Hongwei Qin <glqinhongwei@gmail.com>
Date: Sat, 16 Jan 2021 18:34:10 +0000
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gSW4gdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24sIHNob3VsZF9jaA==?= =?UTF-8?B?ZWNrX
Message-Id: <CAKvRR0QXuETjF3zMb_CBPhGt9h_WeYp8y3TVL7fK4FvS8hqQqA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1610817523-6789-1-git-send-email-glqinhongwei@gmail.com> <40f475e1-2352-5bc5-3823-ddc40de3299e@web.de>
In-Reply-To: <40f475e1-2352-5bc5-3823-ddc40de3299e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>

Hi Makus,
My apology for sending to the wrong mail list. Please ignore this
email. I'll reformat it and send it to the fio maillist.

Regards,
Hongwei

On Sun, Jan 17, 2021 at 2:10 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > This patch addresses the issue by not checking td->bytes_done in should_check_rate.
>
> I suggest to improve the change description.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id94330a437a573cfdf848f6743b1ed169242c8a#n89
>
> Please choose a succinct patch subject.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id94330a437a573cfdf848f6743b1ed169242c8a#n569
>
>
> > +++ b/fio.h
>
> Do you refer to a header file from a special repository here?
> https://github.com/axboe/fio/blame/4008b7fc8e2bff60a4e98de0005e6bc71b1a8641/fio.h#L765
>
> Regards,
> Markus
