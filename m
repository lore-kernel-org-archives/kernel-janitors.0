From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Date: Fri, 16 Mar 2007 23:20:37 +0000
Subject: Re: [KJ] [RFC] A need for "yesno"-function? (and "cleanup" of
Message-Id: <Pine.LNX.4.61.0703170019010.23117@yvahk01.tjqt.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45F95351.60308@student.ltu.se> <39e6f6c70703152036m778ea054gf32723d0eda2be68@mail.gmail.com>
 <45FAB6C5.8050302@student.ltu.se>
In-Reply-To: <45FAB6C5.8050302@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Knutsson <ricknu-0@student.ltu.se>
Cc: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, Kernel Janitors List <kernel-janitors@lists.osdl.org>, linux-kernel@vger.kernel.org


On Mar 16 2007 16:24, Richard Knutsson wrote:
>> > 
>> > char yesno_chr(const bool value)
>> > {
>> >        return "ny"[value];
>> > }
>> > 
>> > char *yesno_str(const bool value)
>> > {
>> >        return &"no\0yes"[3 * value];
>> > }

static/extern const char *const yesno[] = {"no", "yes"};
static inline const char *yesno_str(bool value)
{
	return yesno[value];
}
#or
#define yesno_str(value) yesno[!!(value)]

>> > Thoughts?


Jan
-- 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
