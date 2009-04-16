From: Joe Damato <ice799@gmail.com>
Date: Thu, 16 Apr 2009 23:56:58 +0000
Subject: Re: [PATCH 05/56] block: Remove void casts
Message-Id: <3605561d0904161656r66e6b2a4q32b354ea15ad4742@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Thu, Apr 16, 2009 at 2:16 AM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Sat, Apr 11, 2009 at 02:55:32PM +0200, walter harms wrote:
>>
>>
>> Al Viro schrieb:
>> > On Wed, Apr 08, 2009 at 01:31:43PM +0200, Bert Wesarg wrote:
>> >> If typeof(c) =3D CommandList_struct*, that you could replace
>> >> sizeof(CommandList_struct) with sizeof(*c) to make the expression
>> >> shorter and fit into one line.
>> >
>> > This is not commonly accepted as a good thing. =A0In particular, I wou=
ld
>> > seriously ask you to avoid doing anything of that kind around fs/*
>>
>> just for the curious ...
>> What is the dark side of replacing ?
>> foo=3Dmalloc(sizeof(struct fo)) -> foo=3Dmalloc(sizeof( *foo) ))
>
> The latter is ungreppable.

For the curious, round 2: I was under the impression (perhaps
incorrectly) that sizeof(*foo) was useful because if the type of foo
changes (say from struct fo to struct new_fo), you do not need to go
fishing around the source changing all the "struct fo" to "struct
new_fo."

This probably doesn't matter though if all the other code is already
doing sizeof(struct fo), because you'll have to go fishing anyway.

Joe
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
