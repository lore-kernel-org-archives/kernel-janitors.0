From: Vikram Dhillon <dhillonv10@gmail.com>
Date: Sun, 07 Mar 2010 03:29:54 +0000
Subject: Re: [patch] security: ima_file_mmap() don't just return zero
Message-Id: <ea6602021003061929y6324e019n3b7e941804638342@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100306112125.GN4958@bicker>
	 <ea6602021003061330j56132f8er73e27f017e6b9d09@mail.gmail.com>
	 <OFC651A6C0.BD37C0C8-ON852576DF.0004365B-852576DF.00045289@us.ibm.com>
In-Reply-To: <OFC651A6C0.BD37C0C8-ON852576DF.0004365B-852576DF.00045289@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Mimi Zohar <zohar@us.ibm.com>
Cc: Eric Paris <eparis@redhat.com>, Dan Carpenter <error27@gmail.com>, "J.R. Okajima" <hooanon05@yahoo.co.jp>, James Morris <jmorris@namei.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

On Sat, Mar 6, 2010 at 7:47 PM, Mimi Zohar <zohar@us.ibm.com> wrote:
> Vikram Dhillon <dhillonv10@gmail.com> wrote on 03/06/2010 04:30:33 PM:
>
>> On Sat, Mar 6, 2010 at 6:21 AM, Dan Carpenter <error27@gmail.com> wrote:
>> > It seems like we should return an error here.  That's what the comment
>> > says we should do.
>> >
>> > I also removed an out of date comment.  It wasn't needed and seemed
>> > likely
>> > to get out of date again.
>> >
>> > Signed-off-by: Dan Carpenter <error27@gmail.com>
>> > ---
>
> The current code and comment are correct, as the return code will reflect
> the file's integrity appraisal, which hasn't yet been implemented.
>
> Mimi

Oh right :) I guess we aren't at a point yet to enforce integrity, so
what should the return code return? Based on the comment the code
seemed okay but I think we may have to base it on measurement
appraisal in LIM (then again, not too sure if this is the right
approach).

-- 
Regards,
Vikram Dhillon

~~~
There are lots of Linux users who don't care how the kernel works, but
only want to use it. That is a tribute to how good Linux is.
-- Linus Torvalds
