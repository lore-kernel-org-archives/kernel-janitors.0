From: Jeremy Fitzhardinge <jeremy@goop.org>
Date: Wed, 29 Oct 2008 12:53:41 +0000
Subject: Re: [PATCH 02/12] x86: Use new gate_struct for gate_desc
Message-Id: <49085CD5.7060703@goop.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1224904532-9586-1-git-send-email-ice799@gmail.com> <52f8491fb5d55c0171840b01638ea6db0a98f3be.1224903712.git.ice799@gmail.com> <03269a2e8f455b431612a32e8cce048e98c75b27.1224903712.git.ice799@gmail.com>
In-Reply-To: <03269a2e8f455b431612a32e8cce048e98c75b27.1224903712.git.ice799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Damato <ice799@gmail.com>
Cc: linux-x86_64@vger.kernel.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Joe Damato wrote:
> Change the gate_desc typedef to use the new gate_struct.
>   

Blerk, yes.  I'd really prefer these typedefs to use the _t convention.

    J
