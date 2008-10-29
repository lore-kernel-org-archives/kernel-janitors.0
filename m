From: Jeremy Fitzhardinge <jeremy@goop.org>
Date: Wed, 29 Oct 2008 12:54:10 +0000
Subject: Re: [PATCH 04/12] x86: Add macros for gate_desc
Message-Id: <49085CF2.4080406@goop.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1224904532-9586-1-git-send-email-ice799@gmail.com> <52f8491fb5d55c0171840b01638ea6db0a98f3be.1224903712.git.ice799@gmail.com> <03269a2e8f455b431612a32e8cce048e98c75b27.1224903712.git.ice799@gmail.com> <4810cc08c12cd78612b53f9b52d7ba93a9b03fd0.1224903712.git.ice799@gmail.com> <a9cabc5cabdb5a10631e2a6dc330c54826f2b210.1224903712.git.ice799@gmail.com>
In-Reply-To: <a9cabc5cabdb5a10631e2a6dc330c54826f2b210.1224903712.git.ice799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Damato <ice799@gmail.com>
Cc: linux-x86_64@vger.kernel.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Joe Damato wrote:
> Add useful macros which can be used to access the lo and hi 32bit words, get the offset of the handler, and get the segment for gate_descs.
>   

Can you make them inline functions?

    J
