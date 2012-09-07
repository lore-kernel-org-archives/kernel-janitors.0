From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Fri, 07 Sep 2012 12:36:37 +0000
Subject: Re: [PATCH 8/10] net/mac80211/scan.c: removes unnecessary semicolon
Message-Id: <CA+MoWDpYEsmWFKb0vyR-6Cn7hcYtz161X4iB1ySGGUUSfCxEpg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346947757-10481-9-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1346947757-10481-9-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Please note that there are some false positives reported by this
semantic patch, so I'm still working on it. I've removed lists from
CC, kept only kernel-janitors.

// <smpl>
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
// </smpl>

On Fri, Sep 7, 2012 at 1:30 PM, Johannes Berg <johannes@sipsolutions.net> wrote:
> On Thu, 2012-09-06 at 18:09 +0200, Peter Senna Tschudin wrote:
>> From: Peter Senna Tschudin <peter.senna@gmail.com>
>>
>> removes unnecessary semicolon
>>
>> Found by Coccinelle: http://coccinelle.lip6.fr/
>
> Applied. It'd be nice to have the spatch, I guess :)
>
> johannes
>



-- 
Peter
