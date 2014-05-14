From: Masaru Nomura <massa.nomura@gmail.com>
Date: Wed, 14 May 2014 14:07:32 +0000
Subject: Re: [Q] Sending a large patch
Message-Id: <CAAvxhqBT3xF7DRCTXDayJb-uJqHTiEtaWJqUpYOS4z8gPgfMXw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAAvxhqBUO2HSgZjw=H7=Bd2gdw=JSjAs2Lx8E7rrGw8uqieZAg@mail.gmail.com>
In-Reply-To: <CAAvxhqBUO2HSgZjw=H7=Bd2gdw=JSjAs2Lx8E7rrGw8uqieZAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thank you for your reply.

>> Now, I'm cleaning up a file and it has over 100 warnings of line over
>> 80 character issues. As the problem seems to be the same, I may
>
> And you are really sure that is more readable afterwards with the
> additional line breaks?

Well, my intention is to follow the coding style[1].
As far as I understand, we follow this for linux-code readability.
(Of course, I think I shouldn't split/break a line in a bad way though.)

Chap 2 says:
The limit on the length of lines is 80 columns and this is a strongly
preferred limit.

Or are there any situations where we ignore over 80 characters?

>> correct the bugs and send one commit. But I think it's a pain for
>> reviewers to check all of them within one patch.
>
> Apart from the questionable usefulness of the above, you should split it
> per subsystem/maintainer so that people do not need to look for "their"
> parts.

I'm working on just one file so I think the relevant maintainers are the
same. (Do I have it correct?)

Or do you mean I should make multiple patches depending on the information
of who takes responsibility of which part within the same file? If
this is the case,
is there a good tool to do this easily?

Thank you,
Masaru

[1] https://www.kernel.org/doc/Documentation/CodingStyle
