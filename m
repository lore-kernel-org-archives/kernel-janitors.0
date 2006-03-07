From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Tue, 07 Mar 2006 23:43:32 +0000
Subject: Re: [KJ][Patch] change for to while(1) in 3c515.c
Message-Id: <82faac5b0603071543t5b74a061s9f773d2d439965e0@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141718301.8347.16.camel@localhost.localdomain>
In-Reply-To: <1141718301.8347.16.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 3/8/06, Bernd Petrovitsch <bernd@firmix.at> wrote:

> Yes, but not endless. So s/>=/>/ should be more in spirit of the old
> solution.

I am not sure what the old solution was trying to do, wait for a
command to complete, or 20 loops checking ?
It seems more reasonable to me to simply wait for the command to
finish as a timeout would/should be checking against a time, not 20
iterations of a loop which could take any random time to complete.
Also continuing on at that point before the command has finished my
cause problems, I don't know, but the code was waiting for it to
finish for a reason.

Darren J.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
