From: "Kasatkin, Dmitry" <dmitry.kasatkin@intel.com>
Date: Mon, 06 Aug 2012 15:56:22 +0000
Subject: Re: [digsig:next-ima-module 13/27] evm_crypto.c:(.text+0x300): multiple definition of `integrity_ini
Message-Id: <CALLzPKZw13O35V9xddsug0oUX7vzm4HntPPCBM-VqvkuXVdg8Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120806151604.GA7063@localhost>
In-Reply-To: <20120806151604.GA7063@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,

That was error in my latest patchset.
I fixed that..

Mimi, those messages are from automatic testing system.
It is good that it spot some build errors.

Take those messages as FYI. No need to respond to them :)

- Dmitry

On Mon, Aug 6, 2012 at 6:27 PM, Mimi Zohar <zohar@linux.vnet.ibm.com> wrote:
> On Mon, 2012-08-06 at 23:16 +0800, Fengguang Wu wrote:
>> Hi Mimi,
>>
>> Kernel build failed on
>>
>> tree:    next-ima-module
>> head:   a7d2a27e48c3d6b9b139728f0cdafc71e7640d47
>> commit: 13c112b67029d66003085d6dc10e78b4e78108d0 [13/27] integrity: create and inititialize a keyring with builtin public key
>> config: i386-randconfig-k621 (attached as .config)
>>
>> All related error/warning messages:
>>
>> security/integrity/evm/evm_crypto.o: In function `integrity_init_keyring':
>> evm_crypto.c:(.text+0x300): multiple definition of `integrity_init_keyring'
>> security/integrity/evm/evm_main.o:evm_main.c:(.text+0x360): first defined here
>> security/integrity/evm/evm_secfs.o: In function `integrity_init_keyring':
>> evm_secfs.c:(.text+0x140): multiple definition of `integrity_init_keyring'
>> security/integrity/evm/evm_main.o:evm_main.c:(.text+0x360): first defined here
>
> The patch ordering is wrong, but this isn't my tree.  Please let me
> know, if/when this happens in my tree.
>
> thanks,
>
> Mimi
>
