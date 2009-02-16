From: Manish Katiyar <mkatiyar@gmail.com>
Date: Mon, 16 Feb 2009 15:11:16 +0000
Subject: Re: [PATCH] Remove errors caught by checkpatch.pl in
Message-Id: <ea11fea30902160659q58578152gea3f4da3821c8e0c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902151039n447cc111medb9721a95af81a8@mail.gmail.com>
	 <49996588.2040501@s5r6.in-berlin.de>
In-Reply-To: <49996588.2040501@s5r6.in-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: mingo@elte.hu, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, mkatiyar@gmail.com

[resending with changed changelog based on stefan's comments]

On Mon, Feb 16, 2009 at 6:39 PM, Stefan Richter
<stefanr@s5r6.in-berlin.de> wrote:
> Manish Katiyar wrote:
>> --- a/kernel/utsname_sysctl.c
>> +++ b/kernel/utsname_sysctl.c
>> @@ -49,7 +49,7 @@ static int proc_do_uts_string(ctl_table *table, int
>> write, struct file *filp,
>>       int r;
>>       memcpy(&uts_table, table, sizeof(uts_table));
>>       uts_table.data = get_uts(table, write);
>> -     r = proc_dostring(&uts_table,write,filp,buffer,lenp, ppos);
>> +     r = proc_dostring(&uts_table, write, filp, buffer, lenp, ppos);
>>       put_uts(table, write, uts_table.data);
>>       return r;
>>  }
>> @@ -142,4 +142,4 @@ static int __init utsname_sysctl_init(void)
>>       return 0;
>>  }
>>
>> -__initcall(utsname_sysctl_init);
>> +device_initcall(utsname_sysctl_init);
>
> The changelog should note that this is a whitespace fix + initcall
> annotation change.
>
> That checkpatch was somehow involved in the creation of this patch is
> entirely uninteresting for the changelog.

Replace deprecated __initcall with equivalent device_initcall. Also
fix whitespaces.

Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
---
 kernel/utsname_sysctl.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/utsname_sysctl.c b/kernel/utsname_sysctl.c
index 3b34b35..d1dc4ca 100644
--- a/kernel/utsname_sysctl.c
+++ b/kernel/utsname_sysctl.c
@@ -49,7 +49,7 @@ static int proc_do_uts_string(ctl_table *table, int
write, struct file *filp,
 	int r;
 	memcpy(&uts_table, table, sizeof(uts_table));
 	uts_table.data = get_uts(table, write);
-	r = proc_dostring(&uts_table,write,filp,buffer,lenp, ppos);
+	r = proc_dostring(&uts_table, write, filp, buffer, lenp, ppos);
 	put_uts(table, write, uts_table.data);
 	return r;
 }
@@ -142,4 +142,4 @@ static int __init utsname_sysctl_init(void)
 	return 0;
 }

-__initcall(utsname_sysctl_init);
+device_initcall(utsname_sysctl_init);
-- 
1.5.4.3


Thanks -
Manish

> --
> Stefan Richter
> -===-=--= --=- =----
> http://arcgraph.de/sr/
>
