From: Rudy Matela <rudy.matela@gmail.com>
Date: Fri, 08 Jan 2010 16:12:03 +0000
Subject: Re: Is this project still alive?
Message-Id: <235c15c11001080812i1f5166e7j31d9d6654ea66271@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a7e3224b1001071441h49a797ffv18ebe964c5f20b81@mail.gmail.com>
In-Reply-To: <a7e3224b1001071441h49a797ffv18ebe964c5f20b81@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Javier is right, I got a copy from Linux Device Drivers and it's a
very good book. Here is the download link (from the official book
website):
http://lwn.net/Kernel/LDD3/

You can buy a hard copy on some online shop if you want.

On Fri, Jan 8, 2010 at 09:40, Javier Martinez Canillas
<martinez.javier@gmail.com> wrote:
> Hello Andr=E9,
>
> On Thu, Jan 7, 2010 at 7:41 PM, Andr=E9 Silva <andre.beat@gmail.com> wrot=
e:
>> Hi,
>>
>> I'm taking a masters degree in computer engineering and I'm really
>> interested in OSs, so the idea of hacking the linux kernel really got to=
 my
>> curiosity. While I was looking for the best way to start I found this
>> project which seemed a really good way for me to get into the kernel. The
>> thing is the idea I got from the project's website and irc channel is th=
at
>> project is kind of dead. I want to know if that is the case or if there =
is
>> anyone out there willing to help me out.
>
> Yes, there is always people in the community willing to help
>
>> I have a fair knowledge of C programming and UNIX programming, my knowle=
dge
>> of assembly and cpu architectures is a bit poor though.
>>
>
> The Linux kernel is highly portable. Every subsystem (process
> scheduling, memory management, I/O, storage) has a architecture
> dependant part and a platform independent part. So you don't need to
> be a assembly/hardware guru to be a Linux kernel developer as long as
> you stay in the platform independent part of the code.
>
>> Also, if anyone could recommend the "best" way to get my feet wet (books=
 to
>> read, documentation to read, tasks to start hacking), any help would be
>> appreciated.
>>
>
> I dont know if it is the "best" way but I think that a good one is
> first reading about the Linux kernel internals. The best book in my
> opinion is Linux kernel development by Robert Love. Others very good
> books are Linux Device Drivers and Essential Linux Device Drivers.
>
> Then you could make a few very basic modules to get familiar with the
> data structures from your relevant area (i.e: task_struct for
> scheduling or sk_buff for networking).
>
> Once you learn the data structures and the API you could use Linux as
> a platform to develop anything that you want. Then you should
> investigate what it is the state of the art in the area that interest
> you, read some papers, talk with your professors to find a algorithm
> that you could implement in Linux.
>
>> Since the kernel is such a big monster I might add that one of my main
>> interest areas is scheduling.
>>
>
> The first time i hack in the Linux kernel was when I was a student. We
> had an assignment in a operating system course and it was rewriting a
> major part in the Linux kernel. My teammate and I choose scheduling.
> So we implement a really silly fair share scheduler, basically what we
> did was schedule in round robin by group, user and thread.
>
> The implementation didn't support neither SMP nor kernel preemption,
> it was inefficient and buggy, but we learned a lot and served as
> academic purpose. The scheduler wasn't more that 50 lines long but the
> really hard part was figure out what we need to do.
>
> We found in Robert Love's Linux Kernel Development book all the
> information we need to learn how the Linux scheduler works and what
> were the relevant data structures and functions (i.e: struct
> task_struct, context_switch).
>
>> I'm sorry if my English isn't perfect but as it is not my main language
>> there might be some screw ups.
>>
>> Regards,
>> Andr=E9 Silva
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitor=
s" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
> Hope it helps
>
> Best regards
>
> -----------------------------------------
> Javier Mart=EDnez Canillas
> +595 981 88 66 58
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
