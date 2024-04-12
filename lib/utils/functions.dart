import 'package:intl/intl.dart';

String formatTimeAgo(DateTime dateTime) {
  Duration difference = DateTime.now().difference(dateTime);

  if(difference.inDays == 1){
    return "1 day ago";
  } else if (difference.inDays > 0) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
  } else {
    return "justNow";
  }
}