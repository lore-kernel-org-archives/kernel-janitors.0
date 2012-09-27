From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 27 Sep 2012 13:22:15 +0000
Subject: Re: [PATCH] drivers/staging/iio: Remove unnecessary semicolon
Message-Id: <CA+MoWDoazpG7YPM_iC2=AYxnfHeeHKJXxZuvuBEAyxY46KemZg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1348748175-11803-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1348748175-11803-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Shubhrajyoti Datta,

On Thu, Sep 27, 2012 at 2:43 PM, Shubhrajyoti Datta
<omaplinuxkernel@gmail.com> wrote:
> On Thu, Sep 27, 2012 at 5:46 PM, Peter Senna Tschudin
> <peter.senna@gmail.com> wrote:
>> Found by http://coccinelle.lip6.fr/
>
> minor nit :
>
> for the benefit of others you may want to mention the script.

Thanks for asking. Here is the semantic patch I've used:

//<smpl>
@r_case@
position p;
@@
switch (...)
{
case ...: ...;@p
}

@r_default@
position p;
@@
switch (...)
{
default: ...;@p
}

@r1@
statement S;
position p1;
position p != {r_case.p, r_default.p};
identifier label;
@@
(
label:;
|
S@p1;@p
)

@script:python r2@
p << r1.p;
p_case << r_case.p;
p1 << r1.p1;
@@
if p[0].line != p1[0].line_end:
        cocci.include_match(False)
@@
position r1.p;
@@
-;@p
//</smpl>




-- 
Peter
