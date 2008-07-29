From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Date: Tue, 29 Jul 2008 13:06:18 +0000
Subject: Re: [PATCH] fs/fat/dir.c fix resource leak
Message-Id: <87d4kwalh1.fsf@devron.myhome.or.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1217289813.9367.9.camel@localhost.localdomain>
	<87hca8alz6.fsf@devron.myhome.or.jp>
In-Reply-To: <87hca8alz6.fsf@devron.myhome.or.jp> (OGAWA Hirofumi's message of
	"Tue, 29 Jul 2008 21:55:25 +0900")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darren Jenkins <darrenrjenkins@gmail.com>
Cc: kernel Janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

OGAWA Hirofumi <hirofumi@mail.parknet.co.jp> writes:

> "Darren Jenkins\" <darrenrjenkins@gmail.com> writes:
>
>> Coverity CID 2332 & 2333 RESOURCE_LEAK
>>
>> In fat_search_long() if fat_parse_long() returns a -ve value we return
>> without first freeing unicode and bufname.
>> This patch free's them on this error path.
>>
>> Signed-off-by: Darren Jenkins <darrenrjenkins@gmailcom>
>
> I'll apply to current code. Thanks.

I noticed this is false positive. bufname is not used anymore, and
fat_parse_long() never returns error after allocating unicode.

Instead, I'll apply this as cleanup.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
