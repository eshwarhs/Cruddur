import './SuggestedUserItem.css';
import ProfileAvatar from 'components/ProfileAvatar'

export default function SugestedUserItem(props) {
  const backgroundImage = `url("https://assets.crudders.click/avatars/${props.id}.jpg")`;
  const styles = {
    backgroundImage: backgroundImage,
    backgroundSize: 'cover',
    backgroundPosition: 'center',
    minWidth: '36px',
    minHeight: '36px',
    borderRadius: '999px'
  };
  return (
    <div className="user">
      <div className='avatar'><div
        className="suggested-avatar"
        style={styles}
      ></div></div>
      <div className='identity'>
        <span className="display_name">{props.display_name}</span>
        <span className="handle">@{props.handle}</span>
      </div>
    </div>
  );
}